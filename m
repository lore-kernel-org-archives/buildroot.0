From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jun 2019 09:37:41 +0200
Subject: [Buildroot] [PATCH 1/3] package/pcsc-lite: drop unneeded first
 patch
In-Reply-To: <20190518214349.5979-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 18 May 2019 23:43:47 +0200")
References: <20190518214349.5979-1-fontaine.fabrice@gmail.com>
Message-ID: <87imtjuptm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This patch is not needed as static build has been disabled since
 > commit ad8c327053f3736881e1ef6d7b394b3a500ed8fa

 > Moreover, pthread dependency should be correclty retrieved from
 > libusb-1.0.pc

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
