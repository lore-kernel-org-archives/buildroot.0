From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 22:29:59 +0200
Subject: [Buildroot] [PATCH 00/10] Misc CVE ignores
In-Reply-To: <20210424092952.GS298901@scaer> (Yann E. MORIN's message of "Sat, 
 24 Apr 2021 11:29:52 +0200")
References: <20210421204235.5956-1-matthew.weber@rockwellcollins.com>
 <20210424092952.GS298901@scaer>
Message-ID: <87a6pkhjqw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Matt, All,
 > On 2021-04-21 15:42 -0500, Matt Weber spake thusly:
 >> * I'm working on upstream NVD fixes for some of these.
 >> 
 >> * There are roughly half of the ignore cases that are a bit of a
 >> challenge to identify where the fix was clearly tracked into
 >> a specific version. I tried to document in each commit as much
 >> as a could by linking to conversations clarifying the details.
 >> 
 >> Matt Weber (10):
 >> package/bind: ignore CVE-2017-3139
 >> package/coreutils: ignore CVE-2013-0221, CVE-2013-0222, CVE-2013-0223
 >> package/bind: ignore CVE-2019-6470
 >> package/cmake: ignore CVE-2016-10642
 >> package/flex: ignore CVE-2019-6293

 > For this one, I've switched to using the actual upstream URL, rather
 > that of a downstream consumer:
 >     https://github.com/westes/flex/issues/414

 >> package/hostapd: ignore CVE-2021-30004 when using openssl
 >> package/wpa_supplicant: ignore CVE-2021-30004 when using openssl
 >> package/ncurses: ignore CVE-2018-10754, CVE-2018-19211,
 >> CVE-2018-19217, CVE-2019-17594, CVE-2019-17595
 >> package/rsyslog: ignore CVE-2015-3243
 >> package/tar: ignore CVE-2007-4476

 > Series applied to master, thanks.

I am not so happy with the hostapd/wpa_supplicant/rsyslog ignores, but I
have applied the series to 2021.02.x anyway and will send followup
patches to master (and 2021.02.x) to improve those packages later.

-- 
Bye, Peter Korsgaard
