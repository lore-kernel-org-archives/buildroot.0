From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 22 Jan 2007 17:45:15 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/kexec
In-Reply-To: <20061220170136.GY2778@ibawizard.net>
References: <20061220165004.E3D5D48598@busybox.net>
	<20061220170136.GY2778@ibawizard.net>
Message-ID: <20070122164515.GA4981@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 20, 2006 at 06:01:36PM +0100, Petr Stetiar wrote:
>aldot at uclibc.org <aldot@uclibc.org> [2006-12-20 08:50:04]:
>
>> Author: aldot
>> Date: 2006-12-20 08:50:04 -0800 (Wed, 20 Dec 2006)
>> New Revision: 17018
>> + static int my_shutdown(void)
>> + {
>> + 	char *args[8];
>
>Sorry. Just noticed, that this correctly should be "char *args[2];".

I saw that your arm-support patch broke anybody else (so i broke arm in
turn ;)

Can you please update the kexec/002-add-arch-arm.patch without changing
get_memory..() params in kexec/kexec.c?

Thanks in advance and cheers,
