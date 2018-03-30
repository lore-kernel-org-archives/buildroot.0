From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 23:30:15 +0200
Subject: [Buildroot] [PATCH v2 5/9] docker-proxy: new package
In-Reply-To: <20180301072012.25884-6-christian@paral.in> (Christian Stewart's
 message of "Thu, 1 Mar 2018 02:20:08 -0500")
References: <20180301072012.25884-1-christian@paral.in>
 <20180301072012.25884-6-christian@paral.in>
Message-ID: <87370hxndk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Add docker-proxy package to Buildroot. Needed by docker-engine at
 > runtime, and previously not included. This leads to the following error
 > when attempting to port-map ports to a container:

 >   $ docker run -p 8080:8080 nginx
 >   docker: Error response from daemon: driver failed programming external
 >   connectivity on endpoint:
 >   exec: "docker-proxy": executable file not found in $PATH.

 > Docker expects the docker-proxy binary to exist in the PATH.

 > Signed-off-by: Christian Stewart <christian@paral.in>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
