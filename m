From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 08 Jan 2013 14:46:06 -0300
Subject: [Buildroot] [PATCH] libnl: bump to version 3.2.17
In-Reply-To: <20130108181548.113e00bb@skate>
References: <1357332135-3087-1-git-send-email-gustavo@zacarias.com.ar>
 <20130108181548.113e00bb@skate>
Message-ID: <50EC5B5E.7070400@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/08/2013 02:15 PM, Thomas Petazzoni wrote:

> libnl is causing a recurrent build failure:
> 
>   CC     netfilter/exp_obj.lo
> netfilter/exp_obj.c: In function 'exp_dump_details':
> netfilter/exp_obj.c:271:23: error: 'NF_CT_EXPECT_PERMANENT' undeclared (first use in this function)
> netfilter/exp_obj.c:271:23: note: each undeclared identifier is reported only once for each function it appears in
> netfilter/exp_obj.c:273:23: error: 'NF_CT_EXPECT_INACTIVE' undeclared (first use in this function)
> netfilter/exp_obj.c:275:23: error: 'NF_CT_EXPECT_USERSPACE' undeclared (first use in this function)
> 
> See:
> 
>   http://autobuild.buildroot.org/results/28f23910e2c2090e6f37e8d6a26cdb5adf9615c2/
>   http://autobuild.buildroot.org/results/b8d0b9e7d5ea3a8f3c4ba29faeee0434ea5a1111/
> 
> Could you have a look?

Bump to version 3.2.18 fixes it, fresh release from 4 hours ago.
Let's just hope they're done with this :)
Regards.
