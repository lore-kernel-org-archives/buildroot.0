From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Apr 2010 10:55:18 +0200
Subject: [Buildroot] [PATCH]Add at91sam9g45ekes board support
In-Reply-To: <C83D7CE8356557448A893798C8F9931D050E1F6E@frimb01.corp.atmel.com>
	(Josh Wu's message of "Fri, 9 Apr 2010 10:50:30 +0200")
References: <C83D7CE8356557448A893798C8F9931D050E1F6E@frimb01.corp.atmel.com>
Message-ID: <877hohknt5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Josh" == Wu, Josh <Josh.wu@atmel.com> writes:

 Josh> Hi,
 Josh> Here is a patch to add at91sam9g45ekes board support.

Thanks, committed.

 Josh> +config BR2_TARGET_AT91SAM9G45EKES
 Josh> +	bool "Atmel AT91SAM9G45EKES"
 Josh> +	depends on BR2_TARGET_AT91SAM9G45
 Josh> +	select BR2_BOOTSOURCE_DATAFLASHCARD
 Josh> +	select BR2_BOOTSOURCE_NANDFLASH
 Josh> +	help
 Josh> +	  The Atmel AT91SAM9G45 Development Board
 Josh> +	  

You have trailing spaces here, but I've fixed that.

-- 
Bye, Peter Korsgaard
