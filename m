From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 23 Aug 2013 10:28:35 -0300
Subject: [Buildroot] [PATCH 1/5] attr: add patch to fix static
	installation
In-Reply-To: <1376996584-4462-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1376996584-4462-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1376996584-4462-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <52176383.80809@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/20/2013 08:03 AM, Thomas Petazzoni wrote:

> When attr is built static-only, it forgets to install its libattr.a
> file, which leads to the build failure of packages such as 'acl' that
> rely on attr.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
