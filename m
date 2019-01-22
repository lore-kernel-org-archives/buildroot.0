From: Patrick Doyle <wpdster@gmail.com>
Date: Tue, 22 Jan 2019 11:47:26 -0500
Subject: [Buildroot] Has anybody tried packaging up fluoride for buildroot?
Message-ID: <CAF_dkJD7vVUxCurgdNy5nxv-VqxNq+Fs-eQuZTvoQJh3j-0QmQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I notice that there are no package files for fluoride
(https://android.googlesource.com/platform/system/bt).

I also notice that the build instructions at that link are somewhat complicated:
1. git clone bt
2. install dependencies
3. Fetch third party dependencies:
mkdir third_party; cd third_party; for x in LIST OF OTHER REPOS; do git clone x
4. Fetch third party dependencies of third party dependencies...

at this point, I figure I should take a step back and see if anybody
else in the community has tried this and what you may have learned
from your attempt...

Thanks.

--wpd
