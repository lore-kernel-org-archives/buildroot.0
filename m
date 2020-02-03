From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Feb 2020 17:34:37 +0100
Subject: [Buildroot] [PATCH ] package/sdl2: SDL2 2.0.09 to Version 2.0.10
In-Reply-To: <1270bd947c2e436e940d0a07f7f7e5a0@go-sys.de> (Michael Fischer's
 message of "Mon, 3 Feb 2020 14:48:22 +0000")
References: <1270bd947c2e436e940d0a07f7f7e5a0@go-sys.de>
Message-ID: <87v9on1vfm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Fischer <mf@go-sys.de> writes:

Hello,

Thank you for your contribution. There unfortunately were a few issues:

- Your mailed had corrupted white space in the patch, so it couldn't be
  applied. Please consider using git send-email and test by mailing
  yourself a patch and verify that it can be applied for the future

- You forgot to add your signed-off-by (git commit -s) to your
  commit. Given how trivial the patch is I decided to ignore that and
  add it for you

- You forgot to adjust the comment in the hash file to refer to 2.0.10

- You forgot to adjust the hash of COPYING.txt to take into
  consideration the change in copyright year. Please remember to check
  that the licensing info is still correct when bumping a package
  version (make sdl2-legal-info).

Committed with those issues fixed, thanks.

-- 
Bye, Peter Korsgaard
