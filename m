From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 11 Sep 2007 23:56:08 +0200
Subject: [Buildroot] Multiprojects
References: <D61182AC8012EA4EBC531B3AF23BE1093F1302@tranzeo-mail2.12stewart.tranzeo.com>
Message-ID: <000201c7f4be$e8bb2190$2d03310a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hello Ulf,
> 
> I looked at your patch and will give it a test drive.  From what I
> looked at, I think that the ...
> 
>  $ make saveconfig
> 
> ... and the ...
> 
>  $ make BOARD=<board>
> 
> ... should work OK, but I think that the ...
> 
>  $make getconfig
> 
> ... will just overwrite the .config from the project specified from
> within that .config file.  Should it be used like ...
> 
>  $make BOARD=<board> getconfig
> 
> ...instead?

Yes.


> 
> Regards,
> 
> Darcy


Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57
