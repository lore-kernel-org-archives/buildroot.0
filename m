From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 19:39:38 +0100
Subject: [Buildroot] [PATCH 1/2] package/libvorbis: fix CVE-2018-10392
In-Reply-To: <20200301180226.186420-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 1 Mar 2020 19:02:25 +0100")
References: <20200301180226.186420-1-fontaine.fabrice@gmail.com>
Message-ID: <877dzmrdat.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > mapping0_forward in mapping0.c in Xiph.Org libvorbis 1.3.6 does not
 > validate the number of channels, which allows remote attackers to cause
 > a denial of service (heap-based buffer overflow or over-read) or
 > possibly have unspecified other impact via a crafted file.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
