From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 15 Jan 2019 06:17:28 -0600
Subject: [Buildroot] Migration to OpenSSL 1.1.1?
In-Reply-To: <OFCE363AB5.EB39827A-ONC1258383.0037AF48-C1258383.0038BD5C@local-dmz.de>
References: <OFCE363AB5.EB39827A-ONC1258383.0037AF48-C1258383.0038BD5C@local-dmz.de>
Message-ID: <CANQCQpYePwq3HHJxOjE3F=EFzp0=-AfPUL+KX0gtXyOrHU5p4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcel,

On Tue, Jan 15, 2019 at 4:30 AM Marcel Patzlaff <M.Patzlaff@pilz.de> wrote:
>
> Hello,
>
> after reading https://www.openssl.org/source/ (especially the part where
> the version support is stated), the following question pops up:
> Are there plans to migrate the openssl package to 1.1.1?

There are some efforts starting to bump to the latest stable 1.1.1.
We're hoping we can get things bumped before things freeze for the
next release.

> Not long ago, a switch was introduced to drop-in replace openssl with
> libressl (which has OpenSSL 1.0.1 API compatibility).
> Are there reasons for this?
> Or are there problems with OpenSSL 1.1.1 which I do not know about yet?

I'm not familiar enough with the differences.  My reason for the bump
is to get some buffer performance rewrites in the latest 1.1.1 which
improve cryptography performance when a hardware engine is used.

Matt
