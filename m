From: Darcy Watkins <DWatkins@tranzeo.com>
Date: Tue, 11 Sep 2007 10:47:45 -0700
Subject: [Buildroot] Multiprojects
Message-ID: <D61182AC8012EA4EBC531B3AF23BE1093F1302@tranzeo-mail2.12stewart.tranzeo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ulf,

I looked at your patch and will give it a test drive.  From what I
looked at, I think that the ...

  $ make saveconfig

... and the ...

  $ make BOARD=<board>

... should work OK, but I think that the ...

  $make getconfig

... will just overwrite the .config from the project specified from
within that .config file.  Should it be used like ...

  $make BOARD=<board> getconfig

...instead?

Regards,

Darcy
