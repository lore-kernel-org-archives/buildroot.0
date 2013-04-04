From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 04 Apr 2013 19:01:59 -0300
Subject: [Buildroot] [PATCH 2/2] support/kconfig: add support for
	olddefconfig
In-Reply-To: <1365110666-3080-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1365110666-3080-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1365110666-3080-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <515DF857.3020309@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/04/2013 06:24 PM, Thomas Petazzoni wrote:

> olddefconfig is a new target available in kconfig that allows to take
> an old .config file, and update it to the latest version of the code,
> without being asked for questions: it automatically assumes the
> default value for options whose value was not defined.
> 
> It for example allows to take a minimal defconfig, copy it as .config,
> and do 'make olddefconfig' to get the full .config.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
