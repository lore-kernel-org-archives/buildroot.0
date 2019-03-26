From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Mar 2019 08:01:20 +0100
Subject: [Buildroot] [PATCH v5] package/optee-client: fix build warnings
 from 3.4.0
In-Reply-To: <CAN5uoS9Jgmn1KuAGyjeMge=qHXu8J_28GO=CChCnJ3sO_fwYqg@mail.gmail.com>
References: <20190325105251.5914-1-etienne.carriere@linaro.org>
 <20190325180955.179bcc55@windsurf>
 <CAN5uoS9Jgmn1KuAGyjeMge=qHXu8J_28GO=CChCnJ3sO_fwYqg@mail.gmail.com>
Message-ID: <20190326080120.032ba0ab@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Mar 2019 23:31:55 +0100
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> > Thanks for working on this. However, sorry for being picky, but there
> > are still a few things that could be done better.  
> 
> Please do so.
> And thanks for the feedback and details.

And thanks for your understanding and perseverance!

> The 2nd commit make the first fix stronger. Maybe gcc will complain
> for this in a near future.
> This change fixes an issue that is found in recent GCCs that is not
> reported by not so old GCCs.
> I should have even made the initial fix integrating the 2nd change.

OK, thanks for the explanation. Then please include both patches but as
separate patches, as I explained in my previous reply.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
