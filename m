From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 09:54:13 +0100
Subject: [Buildroot] [PATCH 2/2] boost: make build with python an option
In-Reply-To: <E1CF8EFE2042404B87DE2B6D662128020ED58B9D@KUUMEX10.barco.com>
References: <E1CF8EFE2042404B87DE2B6D662128020ED58B9D@KUUMEX10.barco.com>
Message-ID: <20140304095413.5a37b51d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Derycke, Johan,

On Tue, 4 Mar 2014 08:32:56 +0000, Derycke, Johan wrote:

> +config BR2_PACKAGE_BOOST_PYTHON
> +       depends on BR2_PACKAGE_PYTHON
> +       bool "boost-python"

Just to confirm, boost-python only works with Python 2.x, and not
Python 3.x ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
