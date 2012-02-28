From: Steve Calfee <stevecalfee@gmail.com>
Date: Tue, 28 Feb 2012 11:27:12 -0800
Subject: [Buildroot] Buildroot 2012.02-rc3 released
In-Reply-To: <87ehtg2r6n.fsf@macbook.be.48ers.dk>
References: <87ehtg2r6n.fsf@macbook.be.48ers.dk>
Message-ID: <4F4D2A90.1050309@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/27/2012 08:10 AM, Peter Korsgaard wrote:
> Hi,
>
> Buildroot 2012.02-rc3 is released - Go download it at:
>
snip
> For more details, see the CHANGES file:
>
> http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.02_rc3
>
There seems to be something wrong with the servers. I cannot access the 
url above.

I am also having similar problems with git access:

me:~/nobu/br/dockstar/tools$ git remote -v
origin    http://git.buildroot.net/buildroot (fetch)
origin    http://git.buildroot.net/buildroot (push)



me:~/nobu/br/dockstar/tools$ git fetch
error: Couldn't resolve host 'git.buildroot.net' while accessing 
http://git.buildroot.net/buildroot/info/refs

fatal: HTTP request failed



me:~/nobu/br/dockstar/tools$ git clone 
http://git.buildroot.net/git/buildroot.git test
Cloning into test...
error: Couldn't resolve host 'git.buildroot.net' while accessing 
http://git.buildroot.net/git/buildroot.git/info/refs

fatal: HTTP request failed

Regards, Steve
