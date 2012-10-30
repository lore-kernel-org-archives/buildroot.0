From: Alexander Varnin <fenixk19@mail.ru>
Date: Tue, 30 Oct 2012 15:25:06 +0400
Subject: [Buildroot] Problem building curlftpfs within buildroot
In-Reply-To: <20121030120316.0faf8a0e@skate>
References: <508FB158.1090205@mail.ru> <20121030120316.0faf8a0e@skate>
Message-ID: <508FB912.305@mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

30.10.2012 15:03, Thomas Petazzoni ?????:
> For some reason -lpthread is missing on the link command line.
>
> Thomas
Thanks. It's curlftpfs issue then. I'll write report to them.
