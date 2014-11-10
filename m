From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 10 Nov 2014 15:58:48 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-11-09
In-Reply-To: <5460DF8D.6090705@imgtec.com>
References: <20141110073015.A5296101317@stock.ovh.net>
 <5460DF8D.6090705@imgtec.com>
Message-ID: <5460E0B8.1060705@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/10/2014 03:53 PM, Vicente Olivert Riera wrote:
> On 11/10/2014 07:30 AM, Thomas Petazzoni wrote:
>>     mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/bb8ab5ea7ed02cf17c46522903b4e46035e47f16/
> 
> I thought this was already fixed upstream... I need to report this
> again. It's a failure with MIPS64 n32, probably because it's not taken
> into account that MIPS64 n32 has 32-bit pointers and integers instead of
> 64-bit.

Ok, sorry. qt-4.8.6 was fixed upstream (I did it). The problem here is
with qt-webkit, which I already reported upstream:

https://bugreports.qt-project.org/browse/QTBUG-39224

Regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
