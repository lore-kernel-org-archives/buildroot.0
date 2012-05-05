From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 05 May 2012 09:39:21 -0300
Subject: [Buildroot] [PATCH 1/2] ocf-linux: new package
In-Reply-To: <87wr4qde8n.fsf@macbook.be.48ers.dk>
References: <1336159393-17052-1-git-send-email-gustavo@zacarias.com.ar>
 <1336159393-17052-2-git-send-email-gustavo@zacarias.com.ar>
 <87wr4qde8n.fsf@macbook.be.48ers.dk>
Message-ID: <5e88124f6b69d203ad230db954cd9d4e@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-05-05 09:06, Peter Korsgaard wrote:

> I would move the 'also' - E.G. 'Some libraries need to also have OCF 
> enabled'

Ok.

> How likely is it that this patch will work for a random kernel 
> version?
> From the tarball I see a bunch of patches for different versions, so 
> we
> probably need something smarter than just hardcoding 3.2.1 - Perhaps
> just an option where the user can type the version number of the 
> patch
> they want to use?

Run-tested as low as 2.6.38.x
Build-tested as low as 2.6.35.x
I can give it a run-test on 2.6.35 maybe, depending on how lucky i am 
with my hardware crypto enabled test platforms.

> Trailing spaces (the last empty line).

Fixed.
Let me know regarding the kernel patch what you prefer given the new 
information to avoid sending zillions of versions.
Regards.
