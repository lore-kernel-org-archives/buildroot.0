From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Date: Wed, 7 Mar 2018 12:48:36 -0300 (BRT)
Subject: [Buildroot] [PATCH 1/1] check-package: Flag usage of '\t \\$'.
In-Reply-To: <20180307094812.11293-1-nicolas.cavallari@green-communications.fr>
References: <20180307094812.11293-1-nicolas.cavallari@green-communications.fr>
Message-ID: <237830404.782677.1520437716490.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

> check-package would flag tabs before a backslash ('\t\\'),
> two spaces before a backslash ('  \\') but would not flag a tab before space
> before backslash ('\t \\'), allowing someone to bypass the check.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

Reviewed-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>

Regards,
Ricardo
