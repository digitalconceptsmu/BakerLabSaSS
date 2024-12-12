import { getSession } from "@/lib/getSession"
import { NextRequest} from "next/server"

export default async function middleware(req: NextRequest) {
    const session = await getSession()
    if (!session?.user && req.nextUrl.pathname !== "/login") {
        const newUrl = new URL("/login", req.nextUrl.origin)
        return Response.redirect(newUrl)
    }
}

export const config = {
  matcher: [
    "/((?!api|_next/static|_next/image|favicon.ico|.*\\.).*)",
  ]
}
