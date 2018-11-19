From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Nov 2018 11:20:29 +0100
Subject: [Buildroot] Making the Luarocks integration compatible with
 per-package folders
In-Reply-To: <CAB0FRsveCsQ+Vuk4J4e_LbTRHYQ1prvfQ4+RODP0ZgB9KZYW8w@mail.gmail.com>
References: <20181116170611.0bad6190@windsurf>
 <CAB0FRsveCsQ+Vuk4J4e_LbTRHYQ1prvfQ4+RODP0ZgB9KZYW8w@mail.gmail.com>
Message-ID: <20181119112029.5397e08a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

On Fri, 16 Nov 2018 21:42:20 +0100, Fran?ois Perrad wrote:

> The use of environment variables is doable (I did some experiments in
> master branch).
> The config file is written in plain Lua, but loaded in a sandbox
> environment.
> A small patch of luarocks (see attachment) is required for allowing the
> getenv function.

Thanks a lot for all this feedback, it was extremely useful, and I
could come up with a set of patches that address the problem. I will
send it to the mailing list and Cc you.

Again, thanks a lot for your support!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
