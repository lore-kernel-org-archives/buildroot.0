From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 02 May 2012 06:48:08 -0300
Subject: [Buildroot] [PATCH 3/4] conntrack-tools: new package
In-Reply-To: <20120502103152.1feb57d1@skate>
References: <1335790178-25333-1-git-send-email-gustavo@zacarias.com.ar>
 <1335790178-25333-3-git-send-email-gustavo@zacarias.com.ar>
 <20120502103152.1feb57d1@skate>
Message-ID: <b675744913226d07497d168cc0fb934a@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-05-02 05:31, Thomas Petazzoni wrote:

> Le Mon, 30 Apr 2012 09:49:37 -0300,
> Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :
>
>> +CONNTRACK_TOOLS_DEPENDENCIES = host-bison host-flex host-pkg-config 
>> libnetfilter_conntrack
>
> Bison and Flex are part of our required host dependencies in
> support/dependencies/dependencies.sh. Can't we use these instead?
>
> Thanks!
>
> Thomas

My bad, yes, they're good enough.
I'll respin and resend this patch.
Regards.
