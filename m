From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 Jun 2013 11:52:55 +0200
Subject: [Buildroot] buildroot gnutls issue
In-Reply-To: <CADiUXRwgiRykK7cLLMdZ6v=53MKef9QVFKsA1LGg6WBQzsbnbg@mail.gmail.com>
 (mammar@gmail.com's message of "Mon, 17 Jun 2013 14:41:45 +0500")
References: <CADiUXRwgiRykK7cLLMdZ6v=53MKef9QVFKsA1LGg6WBQzsbnbg@mail.gmail.com>
Message-ID: <87hagxt66g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "mammar" == mammar  <mammar@gmail.com> writes:

 mammar> Hi
 mammar> I get the latest buildroot source and during buildroot nucurses configuration,
 mammar> i am getting this

 mammar> *** gnutls requires a toolchain with WCHAR support ***

 mammar> Can anyone please tell me how to resolve this?

Enable wchar support in the toolchain configuration (Toolchain->Enable
WCHAR support).

Don't forget to do a clean rebuild afterwards (make clean; make)

-- 
Bye, Peter Korsgaard
