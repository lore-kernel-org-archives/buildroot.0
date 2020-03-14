From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 19:28:51 +0100
Subject: [Buildroot] [PATCH 2/3] package/openjpeg: fix CVE-2020-6851
In-Reply-To: <20200229202442.3455662-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 29 Feb 2020 21:24:41 +0100")
References: <20200229202442.3455662-1-fontaine.fabrice@gmail.com>
 <20200229202442.3455662-2-fontaine.fabrice@gmail.com>
Message-ID: <87sgiardss.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > OpenJPEG through 2.3.1 has a heap-based buffer overflow in
 > opj_t1_clbl_decode_processor in openjp2/t1.c because of lack of
 > opj_j2k_update_image_dimensions validation.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
