From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Fri, 22 Nov 2013 03:44:45 -0600
Subject: [Buildroot] [PATCH v2] libcap-ng: disable on avr32 which lacks
	TLS
In-Reply-To: <CAHXCMMK1f9QKw2PKp6KOdqopSgCh4m9GwuW8W4nJg5cNgL=07g@mail.gmail.com>
References: <1385112407-3569-1-git-send-email-s.martin49@gmail.com>
 <OF66C8E7E4.7783087E-ON86257C2B.00344BCA-86257C2B.003487CA@rockwellcollins.com>
 <CAHXCMMK1f9QKw2PKp6KOdqopSgCh4m9GwuW8W4nJg5cNgL=07g@mail.gmail.com>
Message-ID: <OF48061E68.1DE1C05C-ON86257C2B.0035339A-86257C2B.003586E6@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel Martin <s.martin49@gmail.com> wrote on 11/22/2013 03:39:17 AM:

> 2013/11/22 Ryan Barnett <rjbarnet@rockwellcollins.com>

[...]

> > Wouldn't you want comment above saying and !avr32 or something to that
> > extent?

> According to the manual
> (
http://git.buildroot.net/buildroot/tree/docs/manual/adding-packages-directory.txt#n213
),
> this is not needed.
> 

Thanks for the information as I didn't remember off the top of my head! So 
disregard my comment then :)

Thanks,
-Ryan
