From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 11:26:33 +0100
Subject: [Buildroot] [PATCH 1/2] package/libsndfile: fix CVE-2018-19758
In-Reply-To: <20200304222103.1029879-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 4 Mar 2020 23:21:02 +0100")
References: <20200304222103.1029879-1-fontaine.fabrice@gmail.com>
Message-ID: <87k13lncbq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > There is a heap-based buffer over-read at wav.c in wav_write_header in
 > libsndfile 1.0.28 that will cause a denial of service.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
