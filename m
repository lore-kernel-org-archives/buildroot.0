From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Dec 2019 14:46:45 +0100
Subject: [Buildroot] [PATCH v2] package/minicom: make default port and
 lock directory fixed defaults
In-Reply-To: <0102016ea7200662-f8edd1c2-afe0-49e9-b3c7-edfd26668a59-000000@eu-west-1.amazonses.com>
 (James Byrne's message of "Tue, 26 Nov 2019 09:52:04 +0000")
References: <0102016e8e961113-8b7cfd63-a693-49fd-93a3-70b7bb311860-000000@eu-west-1.amazonses.com>
 <0102016ea7200662-f8edd1c2-afe0-49e9-b3c7-edfd26668a59-000000@eu-west-1.amazonses.com>
Message-ID: <87d0d5mshm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Byrne <james.byrne@origamienergy.com> writes:

 > Minicom's configure script will set values for the default port and lock
 > directory based on the configuration of the host machine, which is not
 > useful for cross-compiling or reproducible builds, so instead set them
 > to sensible default values.

 > Signed-off-by: James Byrne <james.byrne@origamienergy.com>

 > ---
 > Changes v1 -> v2:
 >   - Use fixed default values instead of configurable ones.

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
