From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 23 Jun 2008 23:36:44 -0300
Subject: [Buildroot] buildroot snapshot
In-Reply-To: <485C6383.8010806@ripnet.com>
References: <485C6383.8010806@ripnet.com>
Message-ID: <d6cda7730806231936n7211fd34h929fead0f5ef220a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I guess I am looking for confirmation that the snapshot contains
> specific versions of packages and patches, and these same ones will be
> used even if the snapshot is run at a later date.

Yes. Although sometimes packages vanish from their download sites for
whatever reason. In that case, you might be forced to bump versions or
update URLs in .mk files. That's unavoidable, unless you save/mirror
your download folder.
