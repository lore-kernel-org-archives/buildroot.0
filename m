From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 13 Mar 2016 20:45:40 +0100
Subject: [Buildroot] changing sources before patching
References: <56E5BF43.90507@lespocky.de>
Message-ID: <XnsA5CAD3318D579ID313208userindividu@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Alexander Dahl <post@lespocky.de> wrote in
news:56E5BF43.90507 at lespocky.de: 

> This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
> --NrP0L1VLM4NiKNKJwl3xQicXrxMteJBOT
>The problem we face is: some files we need to patch (e.g. configure.ac)
>have CRLF aka DOS line endings and patch fails then.

Hi Alexander,

patching a package where source files contain CRLF is possible with
buildroot, the patch file has to contain CRLF as well, for example see
https://git.busybox.net/buildroot/tree/package/transmission/0001-fix-utypes
.patch 

Regards, Bernd
