From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Apr 2021 21:11:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/upx: fix CVE-2021-20285
In-Reply-To: <20210331213247.1490589-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 31 Mar 2021 23:32:47 +0200")
References: <20210331213247.1490589-1-fontaine.fabrice@gmail.com>
Message-ID: <87sg45yidw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > A flaw was found in upx canPack in p_lx_elf.cpp in UPX 3.96. This flaw
 > allows attackers to cause a denial of service (SEGV or buffer overflow
 > and application crash) or possibly have unspecified other impacts via a
 > crafted ELF. The highest threat from this vulnerability is to system
 > availability.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
