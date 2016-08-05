From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Aug 2016 09:53:53 +0200
Subject: [Buildroot] [RFC 0/2] script to find package licenses
In-Reply-To: <57A44379.9010208@imgtec.com>
References: <1470320164-8241-1-git-send-email-rahul.bedarkar@imgtec.com>
 <20160804183335.0947f9a9@free-electrons.com>
 <57A44379.9010208@imgtec.com>
Message-ID: <20160805095353.68bf1fd9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 5 Aug 2016 13:12:49 +0530, Rahul Bedarkar wrote:

> Intention of script is to help us to verify or correct legal info that 
> we add in .mk file. This could be a handy tool that can be used by 
> anyone when we do version bump or add new package. The complex tools 
> that are available are generally used by upstream package providers for 
> Open Source Compliance which provide lot more information than just file 
> license. And integrating such tools in Buildroot might be difficult. But 
> in Buildroot where we just need license of a package, script could be 
> useful as a starting point.

I'm sorry, but I still don't see why we should merge a script that we
would have to maintain, while there are some existing, actively
developed and more powerful tools doing the same work.

Moreover, I believe that the cases that can be detected automatically
by a script (such as a clear GPL, LGPL, BSD or MIT license) are clearly
not the ones for which it is difficult to write the <pkg>_LICENSE
string.

The ones for which it is difficult are the ones that a script will
never handle as it can't recognize any pattern.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
