From: Stefan Becker <chemobejk@gmail.com>
Date: Fri,  1 Jun 2018 16:30:50 +0300
Subject: [Buildroot] [PATCHv2 propsal/next] replace host-mkpasswd
In-Reply-To: <20180601125900.26400-1-chemobejk@gmail.com>
References: <20180601125900.26400-1-chemobejk@gmail.com>
Message-ID: <20180601133053.27552-1-chemobejk@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed in the mail thread add a host variant of busybox that
provides the "mkpasswd" tool for the build.

v2: split into 3 separate patches + add some reasoning to commit
