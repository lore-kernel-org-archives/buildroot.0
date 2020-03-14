From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 19:39:43 +0100
Subject: [Buildroot] [PATCH 2/2] package/libvorbis: annote CVE-2018-10393
In-Reply-To: <20200301180226.186420-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 1 Mar 2020 19:02:26 +0100")
References: <20200301180226.186420-1-fontaine.fabrice@gmail.com>
 <20200301180226.186420-2-fontaine.fabrice@gmail.com>
Message-ID: <8736aardao.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > bark_noise_hybridmp in psy.c in Xiph.Org libvorbis 1.3.6 has a
 > stack-based buffer over-read.

 > Same patch as for CVE-2017-14160

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
