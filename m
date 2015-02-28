From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Feb 2015 08:15:21 +0100
Subject: [Buildroot] error in skeleton  ?
In-Reply-To: <33C946992B0B426D816DA8DF2CC39BD1@JohanW7> (Sagaert Johan's
 message of "Sat, 28 Feb 2015 00:46:11 +0100")
References: <F7D7D32518D04BB5BEB5B0B4D484022D@JohanW7>
 <87zj7zyqij.fsf@dell.be.48ers.dk>
 <33C946992B0B426D816DA8DF2CC39BD1@JohanW7>
Message-ID: <87mw3yzeuu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

Hi,

> Dear Peter;

 > Agreed, does not make sense to create directories in a mountpoint
 > with devtmpfs.

 > Just wondering if the device_table.txt needs an entry for the /run
 > directory introduced in 2015-02-rc1

Why would it need a device_table.txt entry? It is just a mount point and
the skeleton already has the directory.

-- 
Peter Korsgaard 
