From: Jonathan Boivin <jboivin@progi-media.com>
Date: Mon, 8 Jun 2015 16:33:03 -0400
Subject: [Buildroot] New makedevs.c which can now handle users/groups
	created via FOO_USERS
Message-ID: <CACiQJzy4P+ypbVbMMXM0c0D7s4iJN7w7H2OsMfivQMwNht03rQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi !

This new version is useful when a package create new users via FOO_USERS
and want to use the username newly created into FOO_PERMISSIONS.

http://pastebin.com/UK5WDm7X

*Jonathan Boivin*
Ing?nieur logiciel jr.  ? *Junior software **engineer*
T?l.: 514.272.0599 poste 1205  |  progi-media.com
<http://www.progi-media.com/>


Avis sur la confidentialit? et avertissement relatif ? la Loi sur l'acc?s
aux documents des organismes publics et sur la protection des
renseignements personnels ( L.R.Q., c.A-2.1). L'information transmise par
ce courriel est de nature privil?gi?e et confidentielle. Elle est destin?e
? l'usage exclusif du destinataire ci-dessus. Si vous n'?tes pas le
destinataire vis?, vous ?tes par la pr?sente avis? qu'il est strictement
interdit d'utiliser cette information, de la copier, de la distribuer ou la
diffuser. Si cette communication vous a ?t? transmise par erreur, veuillez
la d?truire et nous en aviser imm?diatement par courriel.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150608/545f6e4a/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 93117B8A-671E-4B1A-ADC8-C44B43B700E8[4].png
Type: image/png
Size: 8311 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150608/545f6e4a/attachment.png>
