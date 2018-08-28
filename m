From: Niall Parker <stuff@npengineering.ca>
Date: Tue, 28 Aug 2018 11:22:34 -0700
Subject: [Buildroot] [[PATCH v2 13/14] package/mender: add
 BR2_PACKAGE_MENDER_ARTIFACT_NAME option
Message-ID: <a8305da7-cb25-8fdb-d087-3618ee239f98@npengineering.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hoping that the subject will associate this comment with the original 
email to the list, my digest archive doesn't go back far enough to reply 
directly.

I understand the BR2_PACKAGE_MENDER_ARTIFACT_NAME and 
BR2_PACKAGE_MENDER_DEVICE_TYPE patches haven't been accepted yet as they 
may be enforcing too much structure on the generated image (files in 
/data/mender etc.) ... mender does need some structure to work with and 
for now I am implementing it with custom post- scripts. It would be 
helpful if the mender package still collected values for the above 
config options even if they are not written till the post- steps.

I understand one suggestion was to just apply the customization in the 
rootfs overlay ... doable but awkward, especially when separating the 
rootfs (updateable) and data (persistent) partitions. Though maybe 
maintaining the dual partitions as separate skeletons makes the most 
sense, have to think about that further.

 ??? ??? ??? ??? ... Niall
