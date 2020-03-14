From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 19:28:47 +0100
Subject: [Buildroot] [PATCH 1/3] package/openjpeg: fix CVE-2019-12973
In-Reply-To: <20200229202442.3455662-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 29 Feb 2020 21:24:40 +0100")
References: <20200229202442.3455662-1-fontaine.fabrice@gmail.com>
Message-ID: <87wo7mrdsw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > In OpenJPEG 2.3.1, there is excessive iteration in the
 > opj_t1_encode_cblks function of openjp2/t1.c. Remote attackers could
 > leverage this vulnerability to cause a denial of service via a crafted
 > bmp file. This issue is similar to CVE-2018-6616.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
