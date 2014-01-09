From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 09 Jan 2014 08:52:13 -0300
Subject: [Buildroot] [PATCH 1/3] dhcpcd: install dhcpcd as
	/usr/sbin/dhcpcd.
In-Reply-To: <1389090561-32196-2-git-send-email-eric.le.bihan.dev@free.fr>
References: <1389090561-32196-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1389090561-32196-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <52CE8D6D.9090205@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/07/2014 07:29 AM, Eric Le Bihan wrote:

> GNU/Linux distributions usually install dhcpcd in /usr/sbin.
> NetworkManager will look for it in this directory.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

(It should live in sbin regardless!)
Regards.
