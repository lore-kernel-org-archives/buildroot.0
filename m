From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jan 2013 18:46:18 +0100
Subject: [Buildroot] Build error : *** Recursive variable
 `DIRECTFB_INPUT' references itself
In-Reply-To: <87bocjasy9.fsf@dell.be.48ers.dk>
References: <C0BEF04D1B814409ACBF0C6A053DE12A@JohanW7>
 <87bocjasy9.fsf@dell.be.48ers.dk>
Message-ID: <20130121184618.33904a75@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Mon, 21 Jan 2013 08:36:14 +0100, Peter Korsgaard wrote:

>  Sagaert> I think it has something to do with this commit : Buildroot]
>  Sagaert> [PATCH 1/2] packages: remove all := signs
> 
> Indeed. I'll fix it up now.

Thanks for digging into this, and fixing (again) the breakage I
introduced.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
