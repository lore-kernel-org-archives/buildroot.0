From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 25 Feb 2014 11:48:56 -0300
Subject: [Buildroot] [PATCH] thrift: needs host-bison
In-Reply-To: <OF76D54DB6.483F34BD-ON86257C8A.0048BD1E-86257C8A.00492E7B@rockwellcollins.com>
References: <1393332928-28879-1-git-send-email-gustavo@zacarias.com.ar>
 <OF76D54DB6.483F34BD-ON86257C8A.0048BD1E-86257C8A.00492E7B@rockwellcollins.com>
Message-ID: <530CAD58.50106@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/25/2014 10:19 AM, Ryan Barnett wrote:

> I believe Thomas P submitted a patch today or last night that does 
> something similar and was accepted. However it doesn't appear that he 
> added a dependancy on the thrift package itself.
> 
> http://patchwork.ozlabs.org/patch/323781/
> 
> Thanks,
> -Ryan

Right, mail backlog and no morning pull got me.
I've already superseeded it in patchwork.
Having it for thrift itself is mostly correctness at the moment since it
depends on host-thrift, just if in the (unlikely) future of that changing.
Regards.
