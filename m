From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Oct 2016 11:04:52 +0200
Subject: [Buildroot] [git commit] core/pkg-generic: check proper package
 installation
In-Reply-To: <87mvhqi30h.fsf@dell.be.48ers.dk>
References: <20161026203713.9732A7FD9B@busybox.osuosl.org>
 <878ttajief.fsf@dell.be.48ers.dk>
 <20161027104658.6edfaae3@free-electrons.com>
 <87mvhqi30h.fsf@dell.be.48ers.dk>
Message-ID: <20161027110452.6f60fcc0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Oct 2016 10:56:30 +0200, Peter Korsgaard wrote:

>  > And Yann's patch has already uncovered an issue with the Bellagio
>  > package.  
> 
> Ok, fine by me. I just wondered as the patch had comments and you afaik
> applied it without any notification.

Yes, I should have replied to your comments after applying the patch,
sorry about that. To me, it felt like Yann's patch was useful today,
and was ready to be merged. It doesn't prevent from doing something
more general/better a later on, but when that "later" on is potentially
quite far in the future (Samuel's series on rpath has been around for a
very very long time), Yann's patch was a good thing to have right now.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
