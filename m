From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 11:15:47 +0100
Subject: [Buildroot] [PATCH 2/2] package/zziplib: fix CVE-2018-17828
In-Reply-To: <20200303201622.283957-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 3 Mar 2020 21:16:22 +0100")
References: <20200303201622.283957-1-fontaine.fabrice@gmail.com>
 <20200303201622.283957-2-fontaine.fabrice@gmail.com>
Message-ID: <875zf5ore4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Directory traversal vulnerability in ZZIPlib 0.13.69 allows attackers to
 > overwrite arbitrary files via a .. (dot dot) in a zip file, because of
 > the function unzzip_cat in the bins/unzzipcat-mem.c file.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.11.x (not in 2019.02.x), thanks.

-- 
Bye, Peter Korsgaard
