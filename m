From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Jul 2021 22:40:17 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/efibootmgr: bump version
 to 17
In-Reply-To: <20210605082818.102556-1-bernd.kuhls@t-online.de>
References: <20210605082818.102556-1-bernd.kuhls@t-online.de>
Message-ID: <f93b3943-bd5b-b6bf-0b00-b38028a576b4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05/06/2021 10:28, Bernd Kuhls wrote:
> Add upstream patch to fix build error:
> 
> efibootmgr.c:1541:15: error: conflicting types for ?efi_set_verbose?
>  1541 |    extern int efi_set_verbose(int verbosity, FILE *errlog);
> 
> Reformatted hashes.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Applied to master, thanks.

 Regards,
 Arnout
