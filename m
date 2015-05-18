From: Floris Bos <bos@je-eigen-domein.nl>
Date: Mon, 18 May 2015 22:34:52 +0200
Subject: [Buildroot] [PATCH 4/6] php: add PHP_VERSION_MAJOR variable
In-Reply-To: <20150518222504.35a1edad@free-electrons.com>
References: <1431978724-25081-1-git-send-email-bos@je-eigen-domein.nl>	<1431978724-25081-4-git-send-email-bos@je-eigen-domein.nl>
 <20150518222504.35a1edad@free-electrons.com>
Message-ID: <555A4CEC.2000309@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/18/2015 10:25 PM, Thomas Petazzoni wrote:
> Dear Floris Bos,
>
> On Mon, 18 May 2015 21:52:02 +0200, Floris Bos wrote:
>> Add PHP_VERSION_MAJOR variable to php.mk for use by other packages.
>> E.g. to install the Ioncube loader binary, it is necessary to
>> know the PHP major version.
> Are such packages going to be submitted to Buildroot at some point?
>

Maybe some time in the future.
There are currently some practical packaging problems with Ioncube, that 
have to be solved by the developer first.
Like that they only offer the latest version of the package for direct 
download, and not previous versions.


Yours sincerely,

Floris Bos
