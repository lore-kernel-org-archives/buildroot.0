From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Feb 2019 17:21:02 +0100
Subject: [Buildroot] [PATCH v2,1/2] package/libid3tag: fix id3tag.pc
In-Reply-To: <20190216134017.3083-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 16 Feb 2019 14:40:16 +0100")
References: <20190216134017.3083-1-fontaine.fabrice@gmail.com>
Message-ID: <87d0nlqfip.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Add -lz to id3tag.pc, this fix is needed to be able to use pkg-config in
 > madplay to find id3tag dependencies

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Thomas Petazzoni):
 >  - Move -lz from Libs to Libs.private

Ups, to be clear - I've cherry picked v2, and not v1 for 2018.02.x /
2018.11.x.

-- 
Bye, Peter Korsgaard
