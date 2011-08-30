From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 30 Aug 2011 14:39:49 -0300
Subject: [Buildroot] [PATCH v2 0/3] netsnmp improvements
In-Reply-To: <1308238033-20127-1-git-send-email-luca@lucaceresoli.net>
References: <1308152878-14593-1-git-send-email-luca@lucaceresoli.net>
 <1308238033-20127-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <927128a95a9a9f1404e458892e17a7c4@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 16 Jun 2011 17:27:10 +0200, Luca Ceresoli wrote:

> Hi,
>
> please ignore the two patches I sent yesterday for netsnmp. Patch 2
> introduced
> an annoying series of warnings, as net-snmp requires the MIB files to 
> be
> installed if the MIB loading code is enabled.
>
> The present patch series addresses this issue correctly, allowing in 
> addition
> to disable the MIB loading code.
>
> Patch 1 is unchanged.
>
> Luca
>
>
> Luca Ceresoli (3):
>   netsnmp: fix stop and restart actions in init script
>   netsnmp: allow to disable MIB loading code
>   netsnmp: allow not to install MIB files

ACK in principle.
However is there any useful scenario where MIB loading code is disabled 
and we want to install MIB files?
I think both options could be condensed into a single one if not.
Regards.
