From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 15 Dec 2008 13:23:13 -0200
Subject: [Buildroot] [PATCH] Make php.ini default config an option
Message-ID: <49467661.7030804@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Add a php config file option to buildroot, like busybox and others have.
Is this wanted or am i missing something?
Without the patch php.ini gets overwritten with a default
non-customizable one.
There are probably other packages that could benefit from this kind of
scenario.
Regards.

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot-php-config.patch
Url: http://busybox.net/lists/buildroot/attachments/20081215/8946d514/attachment.txt 
