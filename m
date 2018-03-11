From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Mar 2018 22:35:01 +0100
Subject: [Buildroot] [PATCH v3 5/8] docker-engine: add dependency on
 docker-proxy
In-Reply-To: <20180304004346.331-6-christian@paral.in> (Christian Stewart's
 message of "Sat, 3 Mar 2018 19:43:43 -0500")
References: <20180304004346.331-1-christian@paral.in>
 <20180304004346.331-6-christian@paral.in>
Message-ID: <87muze5m9m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > docker-proxy is needed by docker-engine at runtime, and was
 > previously not included. This leads to the following error
 > when attempting to port-map ports to a container:

 >   $ docker run -p 8080:8080 nginx
 >   docker: Error response from daemon: driver failed programming external
 >   connectivity on endpoint:
 >   exec: "docker-proxy": executable file not found in $PATH.

 > Docker expects the docker-proxy binary to exist in the PATH.

 > Signed-off-by: Christian Stewart <christian@paral.in>

Committed, thanks.

-- 
Bye, Peter Korsgaard
