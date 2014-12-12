From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 12 Dec 2014 12:27:26 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-12-10
In-Reply-To: <20141212120632.6015df71@free-electrons.com>
References: <20141211073016.EFDC7100E7A@stock.ovh.net>	<5489D6E2.1010002@imgtec.com>	<20141211175508.GQ2440@tarshish>	<5489DB5F.2000101@imgtec.com>	<548AC92B.8060705@imgtec.com>
 <20141212120632.6015df71@free-electrons.com>
Message-ID: <548ADF2E.3020405@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 12/12/2014 11:06 AM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
> 
> On Fri, 12 Dec 2014 10:53:31 +0000, Vicente Olivert Riera wrote:
> 
>> As you can see, -ncurses and -lpanel are passed in the compile line,
>> so..., I don't know what to do now :/
> 
> Trying changing the order of -lncurses and -lpanel, for static linking,
> the order is important.

Yes, that did the trick. I will send a patch soon. Thanks!

Cheers,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
