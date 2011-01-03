From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Jan 2011 10:10:03 +0100
Subject: [Buildroot] building mysqlclient fails when using gcc 4.51 :
 do_abi_check needs perl ?
In-Reply-To: <E1292EBFD5E7463BA24ECFD251C4CCE0@apexjs>
References: <E1292EBFD5E7463BA24ECFD251C4CCE0@apexjs>
Message-ID: <20110103101003.0c08d839@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Dec 2010 20:52:31 +0100
"Sagaert Johan" <sagaert.johan@skynet.be> wrote:

> This build seems to fail on do_abi_check when using GCC 451 (EABI or
> OABI selection in buildroot does not matter):
> 
> I have no idea if this is a GCC 4.5 issue or something with mysql
> client or some other reason.
> 
> Maybe do_abi_check needs perl (see the PATH below) but i do not have
> any perl stuff enabled in buildroot ? 

The ABI check issue has been fixed in later versions of MySQL, and the
mysql_client package in Buildroot Git has been bumped to 5.1.53, which
does not have this problem.

See 24b27158cf103b15b3dd518bbb1b6301a3b0449d

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
