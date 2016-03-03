From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 3 Mar 2016 14:23:37 +0100
Subject: [Buildroot] [PATCH 1/1] busybox: Make S01logging source a
 default file.
In-Reply-To: <56D72F04.9090909@mind.be>
References: <1456483852-12830-1-git-send-email-nicolas.cavallari@green-communications.fr>
 <56D61C10.9080409@lucaceresoli.net> <56D72F04.9090909@mind.be>
Message-ID: <56D83AD9.9070004@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout,

On 02/03/2016 19:20, Arnout Vandecappelle wrote:
> On 03/01/16 23:47, Luca Ceresoli wrote:
[...]
>> Unrelated to your patch, but passing '-n' (Run in foreground) looks
>> strange since we are daemonizing those processes anyway. Do you know any
>> good reason for this?
> 
>  I do: these daemons don't create a PID file, and if they daemonize and
> start-stop-daemon creates the PID file, the PID logged in there will be wrong
> (it will be the PID of the exited parent).

Good point. Thanks.

-- 
Luca
