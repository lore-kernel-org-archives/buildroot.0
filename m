From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Nov 2014 08:26:23 +0100
Subject: [Buildroot] Samba4 build issue
In-Reply-To: <545628BF.2030101@zacarias.com.ar>
References: <20141101233957.7ca9aabd@free-electrons.com>
 <545577D9.1040405@zacarias.com.ar>
 <20141102103811.16e499df@free-electrons.com>
 <545628BF.2030101@zacarias.com.ar>
Message-ID: <20141104082623.33a2136e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun, 02 Nov 2014 09:51:11 -0300, Gustavo Zacarias wrote:
> On 11/02/2014 06:38 AM, Thomas Petazzoni wrote:
> 
> > Ok, so it's libcap causing issues. Have those issues reported upstream?
> > While reverting to an older version libcap being an acceptable
> > temporary workaround, it's not going to be nice on the long run;
> 
> They're fixed, revised patch sent.
> Let's just hope it doesn't break other stuff.

Great, thanks for having worked on this.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
