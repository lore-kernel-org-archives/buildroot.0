From: Stefan Becker <chemobejk@gmail.com>
Date: Fri,  1 Jun 2018 15:58:58 +0300
Subject: [Buildroot] [PATCH proposal/next] replace host-mkpasswd
In-Reply-To: <c55c7a49-77e9-f174-5c90-c8baa950d7da@mind.be>
References: <c55c7a49-77e9-f174-5c90-c8baa950d7da@mind.be>
Message-ID: <20180601125900.26400-1-chemobejk@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed in the mail thread add a host variant of busybox that
provides the "mkpasswd" tool for the build.

Rough first draft that probably requires some polishing.
