From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 Mar 2012 06:49:58 -0300
Subject: [Buildroot] [PATCH 2/3] libxml-parser-perl: add missing dep and
 drop wrong paths
In-Reply-To: <20120312080129.17b94348@skate>
References: <1331517531-2291-1-git-send-email-gustavo@zacarias.com.ar>
 <1331517531-2291-3-git-send-email-gustavo@zacarias.com.ar>
 <20120312080129.17b94348@skate>
Message-ID: <f8989ce8ae25d6cfd8a392ca0b144c17@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-12 04:01, Thomas Petazzoni wrote:

> Le Sun, 11 Mar 2012 22:58:50 -0300,
> Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :
>
>>  $(eval $(call GENTARGETS))
>
> Same thing here: we don't need this anymore, since we don't support
> building libxml-parser-perl for the target. And the
> package/libxml-parser-perl/Config.in could go away as well.
>
> Thomas

I was just trying to address the issue Peter found, not clean them up 
at the same time, but yeah, they could be dropped.
Regards.
