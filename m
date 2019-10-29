From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 Oct 2019 23:48:50 +0100
Subject: [Buildroot] [PATCH 1/2] utils/scancpan: handles misspelled
 LICENCE
In-Reply-To: <20191029043309.11543-1-francois.perrad@gadz.org>
References: <20191029043309.11543-1-francois.perrad@gadz.org>
Message-ID: <fd0895b8-7eec-270f-0f77-f8623d3bdb1c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/10/2019 05:33, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

 Actually, I believe licence is a valid spelling alternative. At least, my
spellchecker doesn't complain about it. So I reworded "misspelled" and applied
both to master, thanks.

 Regards,
 Arnout

> ---
>  utils/scancpan | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/scancpan b/utils/scancpan
> index 484ccaca9..16e495bda 100755
> --- a/utils/scancpan
> +++ b/utils/scancpan
> @@ -567,7 +567,7 @@ sub find_license_files {
>      foreach (split /\n/, $manifest) {
>          next if m|/|;
>          s|\s+.*$||;
> -        push @license_files, $_ if m/(ARTISTIC|COPYING|COPYRIGHT|LICENSE)/i;
> +        push @license_files, $_ if m/(ARTISTIC|COPYING|COPYRIGHT|LICENSE|LICENCE)/i;
>      }
>      if (scalar @license_files == 0 && $manifest =~ m/(README)[\n\s]/i) {
>          @license_files = ($1);
> 
