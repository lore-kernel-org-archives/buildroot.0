From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Apr 2017 09:17:31 +0200
Subject: [Buildroot] [RFC] Adopt a coding style for Python scripts
In-Reply-To: <58f797c522aa7_548710f62c4102f@ultri3.mail>
References: <ff7902df-d244-bbdd-507e-84bf6bc6f1f5@mind.be>
 <58f797c522aa7_548710f62c4102f@ultri3.mail>
Message-ID: <20170420091731.3de60ee5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Apr 2017 14:00:53 -0300, Ricardo Martincoski wrote:

> > On 14-04-17 01:44, Ricardo Martincoski wrote:  
> >> D) adopt the recommendation PEP8 [1] as coding style and the tool pep8 [2] as
> >>    automatic checker for coding style before submitting patches;
> >>    It checks for a subset of the recommendation (e.g. file naming is not
> >>    checked).  
> > 
> >  For me, option D is great. It can also be added to the checkpackage script.  
> 
> I can look into this integration.

I have nothing against option (D), but I'm wondering what is the
relation with the checkpackage script. checkpackage checks packages,
written in Kconfig and Make, what is the relation with complying with
the Python PEP8 recommendation?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
