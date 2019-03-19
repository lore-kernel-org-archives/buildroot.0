From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Mar 2019 19:56:19 +0100
Subject: [Buildroot] [PATCH 0/3] Gummiboot fixup
In-Reply-To: <20190319112852.9592-1-esben.haabendal@gmail.com> (Esben
 Haabendal's message of "Tue, 19 Mar 2019 12:28:49 +0100")
References: <20190319112852.9592-1-esben.haabendal@gmail.com>
Message-ID: <875zseitgs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Esben" == Esben Haabendal <esben.haabendal@gmail.com> writes:

 > From: Esben Haabendal <esben@haabendal.dk>
 > These patches fixes gummiboot for building with toolchains using
 > newer gcc and glibc versions.

 > Esben Haabendal (3):
 >   gummiboot: use new official upstream git repository
 >   gummiboot: upgrade to last commit before being removed
 >   gummiboot: fix compatibility with newer glibc versions

Out of interest, what is the use case for using gummiboot? We recently
added systemd-boot support, so I was considering removing gummiboot as
it is dead upstream.

Notice that you currently cannot enable systemd-boot without the rest of
systemd, so that may be a disadvantage.

-- 
Bye, Peter Korsgaard
